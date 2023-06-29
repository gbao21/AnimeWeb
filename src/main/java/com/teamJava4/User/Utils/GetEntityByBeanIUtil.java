package com.teamJava4.User.Utils;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

public class GetEntityByBeanIUtil {
	public static <T> T getEntity(Class<T> clazz,HttpServletRequest request)  {
		DateTimeConverter dtc = new DateConverter(new Date());
		dtc.setPattern("dd/MM/yyyy"); 
		ConvertUtils.register(dtc, Date.class);
		try {
			T entityT = clazz.newInstance();
			BeanUtils.populate(entityT, request.getParameterMap());
			return entityT;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		}
		return null;
	}

}
