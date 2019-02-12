package com.ecmis.controller;

import com.ecmis.exception.NotLoginException;
import com.ecmis.pojo.ExternalDocument;
import com.ecmis.pojo.User;
import com.ecmis.service.ExternalDocumentService;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RequestMapping(value = "/document/external")
@Controller
public class ExternalDocumentController {

    @Resource
    private ExternalDocumentService externalDocumentService;

    private Logger logger= Logger.getLogger(ExternalDocumentController.class);
    /**
     * 外部文档 主页
     * @return
     */
    @RequestMapping(value = "/index.html")
    public String external(){
        return "document/external/index";
    }
    /**
     * 增加外部文档
     * @return
     */
    @RequestMapping(value = "/add.html")
    public String add(){
        return "document/external/add";
    }


    @RequestMapping(value = "/list.json")
    @ResponseBody
    public String list(@RequestParam(value = "startDate", required = false)Date startDate,
                @RequestParam(value = "endDate", required = false) Date endDate,
                @RequestParam(value = "documentName", required = false) String documentName,
                @RequestParam(value = "rows", required = false) Integer pageSize,
                @RequestParam(value = "page", required = false) Integer pageIndex,
                @RequestParam(value = "status", required = false) Integer status,HttpSession session){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);

        PageSupport<ExternalDocument> pageSupport = externalDocumentService.findByPage(documentName, status, currentLoginUser.getUserId(),startDate, endDate, pageIndex, pageSize);

        return JsonUtil.list2PageJson(pageSupport);
    }

    /**
     * 查询当前等陆的人的公司列表
     * @param startDate
     * @param endDate
     * @param documentName
     * @param pageSize
     * @param pageIndex
     * @param status
     * @param session
     * @return
     */
    @RequestMapping(value = "/auditList.json")
    @ResponseBody
    public String getAuditList(@RequestParam(value = "startDate", required = false)Date startDate,
                       @RequestParam(value = "endDate", required = false) Date endDate,
                       @RequestParam(value = "documentName", required = false) String documentName,
                       @RequestParam(value = "rows", required = false) Integer pageSize,
                       @RequestParam(value = "page", required = false) Integer pageIndex,
                       @RequestParam(value = "status", required = false) Integer status,HttpSession session){

        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);

        PageSupport<ExternalDocument> pageSupport = externalDocumentService.findAuditByPage(documentName,status,currentLoginUser,startDate,endDate,pageIndex,pageSize);

        return JsonUtil.list2PageJson(pageSupport);
    }

    /**
     * 增加时选择文档
     * @return
     */
    @RequestMapping(value = "/selectWord")
    public String selectDocType(@RequestParam(value="docName",required=true)String docName,
                                HttpServletRequest request) {
        String flag="";
        String type="";
        String mainBody = UUID.randomUUID().toString().replace("-", "");
        if(docName.endsWith(".doc") || docName.endsWith(".docx")){
            flag="1";
            type="Word.Document";

        }else if(docName.endsWith(".xls") || docName.endsWith(".xlsx")){
            flag="2";
            type="Excel.Sheet";
        }else if(docName.endsWith(".ppt") || docName.endsWith(".pptx")){
            flag="3";
            type="PowerPoint.Show";
        }
        //mainBody=mainBody+"."+FilenameUtils.getExtension(docName);
        request.setAttribute("opr", "new");
        request.setAttribute("flag", flag);
        request.setAttribute("docName", docName);
        request.setAttribute("type", type);
        request.setAttribute("mainBody", mainBody);
        request.getSession().setAttribute("mainBody",mainBody);
        return "document/external/addexternalword";
    }
    @ExceptionHandler({NotLoginException.class})
    public String handlerNotLogin(NotLoginException ex){
        Map<String ,Object> map=new HashMap<>();
        map.put("result",false);
        map.put("message",ex.getMessage());
        return JsonUtil.getJson(map);
    }
    @RequestMapping(value = "/add.json")
    @ResponseBody
    public String doAdd(ExternalDocument document, HttpSession session, @RequestParam(value = "file", required = false) MultipartFile attach) {
        User currentLoginUser = (User) session .getAttribute(Constants.LOGIN_USER);
        System.out.println(document);
        String mainBody = (String) session.getAttribute("mainBody");
        if (currentLoginUser==null){
            throw new NotLoginException("您还没有登录,或登录信息过期,请先登录!");
        }
        Map<String ,Object> map=new HashMap<>();
        if (!attach.isEmpty()) {
            // 有文件上传
            String path = session.getServletContext().getRealPath(Constants.EXTERNAL_DOCUMENT_PATH);
            String oldFileName = attach.getOriginalFilename();// 原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀

            int fileSize = Constants.MAX_FILE_UPLOAD_SIZE;
            if (attach.getSize() > fileSize) {// 上传大小不得超过 500k
                map.put("result",false);
                map.put("message","上传大小不得超过 "+ (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M");
                return JsonUtil.getJson(map);
            } else if (prefix.equalsIgnoreCase("doc")
                    || prefix.equalsIgnoreCase("docx")) {
                String fileName = UUID.randomUUID().toString().replace("-","") + "." + prefix;
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                try {
                    // 保存
                    attach.transferTo(targetFile);
                    // 保存文件名
                    document.setAttachment(fileName);
                } catch (Exception e) {
                    map.put("result",false);
                    map.put("message","上传附件失败,请联系管理员!");
                    return JsonUtil.getJson(map);
                }
                // idPicPath = path+File.separator+fileName;
            } else {
                map.put("result",false);
                map.put("message","上传格式不正确，请上传doc或docx文件!");
                return JsonUtil.getJson(map);
                //return "上传格式不正确，请上传doc或docx文件";
            }
        }
        try {
            document.setCreationUser(currentLoginUser.getUserId());
            document.setMainBody(mainBody);
            // 保存
            int count = externalDocumentService.add(document);
            if (count > 0) {
                map.put("result",true);
                //map.put("message","上传格式不正确，请上传doc或docx文件!");
                session.removeAttribute("mainBody");
            } else {
                map.put("result",false);
                map.put("message","新增失败!");
            }
        }catch (Exception ex){
            ex.printStackTrace();
            map.put("result",false);
            map.put("message","新增失败,"+ex.getMessage());
        }

        return JsonUtil.getJson(map);

    }
}
