package com.musili.common.commonServlets;

import javax.ejb.Local;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

@Local
public interface CommonServletI {

  Map getFormParameters(HttpServletRequest req);

  long getDuration(Date start, Date end);

}
