package com.sungwoo.aps.services;

import com.sungwoo.aps.commons.ApsProperties;
import com.sungwoo.aps.models.Employee;
import com.sungwoo.aps.repo.EmployeeRepo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author phloc
 */
@Service
public class EmployeeService {
    private final static Logger LOGGER = Logger.getLogger(EmployeeService.class);
    private final EmployeeRepo employeeRepo;
    private final ApsProperties properties;

    @Autowired
    public EmployeeService(EmployeeRepo employeeRepo, ApsProperties properties) {
        this.employeeRepo = employeeRepo;
        this.properties = properties;
    }

    /**
     * Find all area
     *
     * @return list area
     */
    public List<Employee> findAllEmployee() {
        return employeeRepo.findAll();
    }

    /**
     * Find first area that match status
     *
     * @param email
     * @return area
     */
    public Employee findFirstByEmail(String email) {
        return employeeRepo.findFirstByEmail(email);
    }

    public Employee findFirstById(int id) {
        return employeeRepo.findFirstById(id);
    }

}

