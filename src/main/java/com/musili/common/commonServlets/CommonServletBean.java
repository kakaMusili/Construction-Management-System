package com.musili.common.commonServlets;

import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Stateless
public class CommonServletBean implements CommonServletI{


    @Override
    public Map getFormParameters(HttpServletRequest req) {
        Map<String, String> map = new HashMap<>();

        Enumeration enumeration = req.getParameterNames();

        while (enumeration.hasMoreElements()){
            String paramName = (String) enumeration.nextElement();
            map.put(paramName, req.getParameter(paramName));
        }

        return map;
    }

    @Override
    public long getDuration(Date start, Date end) {
        long duration = Math.abs(end.getTime() - start.getTime());
        return TimeUnit.DAYS.convert(duration, TimeUnit.MILLISECONDS);
    }
}
