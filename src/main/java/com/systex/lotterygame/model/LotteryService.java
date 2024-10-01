package com.systex.lotterygame.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;
import java.util.stream.Collectors;


public class LotteryService {

	private int group;
	private String exclude;
	ArrayList<LinkedList<String>> result;
	
	public LotteryService(){	
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public String getExclude() {
		return exclude;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}
	
	public ArrayList<LinkedList<String>> getResult() {
		return result;
	}

	public void setResult(ArrayList<LinkedList<String>> result) {
		this.result = result;
	}

	public ArrayList<LinkedList<Integer>> getNumbers(int groups, LinkedList<String> excludes) {
	    ArrayList<LinkedList<Integer>> totalLotteryNum = new ArrayList<>();
	    
	    Set<Integer> excludeSet = new HashSet<>();
	    for (String exc : excludes) {
	        excludeSet.add(Integer.parseInt(exc));
	    }

	    for (int i = 0; i < groups; i++) {
	        LinkedList<Integer> lotteryNum = new LinkedList<>();
	        while (lotteryNum.size() < 6) {
	            int num = (int) (Math.random() * 49) + 1;
	            if (!excludeSet.contains(num) && !lotteryNum.contains(num)) {
	                lotteryNum.add(num);
	            }
	        }
	        Collections.sort(lotteryNum);
	        totalLotteryNum.add(lotteryNum);
	    }
	    return totalLotteryNum;
	}
}
