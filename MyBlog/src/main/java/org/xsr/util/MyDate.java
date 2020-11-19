package org.xsr.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author 谢胜荣
 * @Date 2020/10/27 9:30
 * @Version 1.0
 */
public class MyDate {

    public static String getDateEndDay(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");   //20201104
        Date date = new Date(System.currentTimeMillis());
        return simpleDateFormat.format(date);
    }
    public static String getDateEndMinute(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        Date date = new Date(System.currentTimeMillis());
        return simpleDateFormat.format(date);
    }
    public static String getDateEndSecondID(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date(System.currentTimeMillis());
        return simpleDateFormat.format(date);
    }

    public static String getDateEndMinutes(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd HH:mm");
        Date date = new Date(System.currentTimeMillis());
        return simpleDateFormat.format(date);
    }
    public static String getDateEndSecond() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        return simpleDateFormat.format(date);
    }

}
