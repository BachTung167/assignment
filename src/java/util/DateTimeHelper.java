/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author sonnt
 */
public class DateTimeHelper {
     public static Date getBeginningOfWeek(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // Set the first day of the week (Monday in this case)
        calendar.setFirstDayOfWeek(Calendar.SUNDAY);
        // Set the calendar to the beginning of the week
        calendar.set(Calendar.DAY_OF_WEEK, calendar.getFirstDayOfWeek());
        // Reset hour, minutes, seconds and millis
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }
     
    public static Date addDaysToDate(Date date, int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, days); //để thêm số ngày được chỉ định vào ngày hiện tại của lịch. Trong trường hợp này, chúng ta sử dụng Calendar.DAY_OF_MONTH 
        //để chỉ ra rằng chúng ta muốn thêm số ngày vào phần ngày của ngày hiện tại.
        return calendar.getTime();
    }
    
    public static ArrayList<java.sql.Date> toList(java.sql.Date from, java.sql.Date to)
    // tao ds từ ngày đầu tiên đến ngày kết thúc 
    {
        ArrayList<java.sql.Date> list = new ArrayList<>();
        Date temp = from;
        while(!temp.after(to))
        {
            list.add(convertUtilToSql(temp));
            temp = addDaysToDate(temp, 1);
        }
        return list;
    }
     
    public static java.sql.Date convertUtilToSql(Date utilDate) {// chuyển đổi số 
        if (utilDate != null) {
            return new java.sql.Date(utilDate.getTime());
        }
        return null;
    }
}
