package com.ajax.web;

import com.ajax.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AjaxController {


    @RequestMapping(value = "/login.json")
    public String login(){
        return "ajax";
    }

    @RequestMapping(value = "/ajax.json")
    public String ResponseAjax(HttpServletRequest request,HttpServletResponse response,User user){
        System.out.println(user);
        return "ajax";
    }

}
