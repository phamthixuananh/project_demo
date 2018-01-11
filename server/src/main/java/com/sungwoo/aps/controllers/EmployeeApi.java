package com.sungwoo.aps.controllers;

import com.sungwoo.aps.models.Area;
import com.sungwoo.aps.models.Employee;
import org.springframework.http.ResponseEntity;


/**
 * @author phloc
 */
public interface EmployeeApi {
    /**
     *
     * @return
     */
    ResponseEntity requestAllArea();

    Employee findEmployeeByEmail(String email);

    Employee findEmployeeById(int id);
}
