package com.systex.lotterygame.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.systex.lotterygame.model.LotteryService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;

@Controller
public class LotteryController {

    @GetMapping("/lottery")
    public String showLotteryForm(Model model) {
        model.addAttribute("errors", new LinkedList<String>());
        return "main"; // 返回樂透主頁
    }

    @PostMapping("/lotteryresult")
    public ModelAndView processLottery(
            @RequestParam("group") String group,
            @RequestParam("exclude") String exclude,
            Model model) {
        ModelAndView modelAndView = new ModelAndView();
        LinkedList<String> errorMsgs = new LinkedList<>();
        model.addAttribute("errors", errorMsgs);
        
        if(exclude == "") {
        	exclude = " ";
        } // 解決排除數字未輸入時exclude的問題

        // 驗證組數
        if (group == null || group.trim().isEmpty()) {
            errorMsgs.add("組數欄位必須填寫");
        } else if (!isInteger(group)) {
            errorMsgs.add("組數位必須是整數");
        }

        // 如果有錯誤，返回主頁
        if (!errorMsgs.isEmpty()) {
        	modelAndView.setViewName("main");
            return modelAndView; // 返回主頁
        }

        int groupNum = Integer.parseInt(group);
        String[] arrayExclude = exclude.split(" ");
        LinkedList<String> linkedExclude = new LinkedList<>(Arrays.asList(arrayExclude));

        ArrayList<LinkedList<Integer>> resultArray;
        try {
            LotteryService lot = new LotteryService();
            lot.setGroup(groupNum);
            lot.setExclude(exclude);
            resultArray = lot.getNumbers(groupNum, linkedExclude);

            model.addAttribute("resultArray", resultArray);
            model.addAttribute("lot", lot);
            modelAndView.setViewName("lotteryresult");
            return modelAndView; // 返回結果頁面
        } catch (Exception e) {
            e.printStackTrace();
            errorMsgs.add(e.getMessage());
            modelAndView.setViewName("main");
            return modelAndView; // 返回主頁
        }
    }

    private boolean isInteger(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}