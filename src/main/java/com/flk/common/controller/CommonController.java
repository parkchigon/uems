package com.flk.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

    @RequestMapping("/Relay.do")
    public String relay(Model model) throws Exception {
        return "common/relay";
    }

    @RequestMapping("/HistoryBack.do")
    public String historyBack(Model model) throws Exception {
        return "common/historyBack";
    }

    @RequestMapping("/common/error/500")
    public String error500(Model model) throws Exception {
        return "common/error/500";
    }

    @RequestMapping("/common/error/404")
    public String error404(Model model) throws Exception {
        return "common/error/404";
    }
    
    @RequestMapping("/common/error/commonError")
    public String commonError(Model model) throws Exception {
        return "common/error/commonError";
    }

}
