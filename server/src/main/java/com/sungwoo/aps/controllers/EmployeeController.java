package com.sungwoo.aps.controllers;

import com.sungwoo.aps.models.Employee;
import com.sungwoo.aps.resp.ModelContainer;
import com.sungwoo.aps.services.EmployeeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author phloc
 */
@Api(value = "Area", description = "Area Api")
@RestController
@RequestMapping("/employee")
public class EmployeeController implements EmployeeApi {
    private final EmployeeService employeeService;

    @Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @Override
    @ApiOperation(value = "Get all Employee info",
            notes = "Mobile App",
            response = ResponseEntity.class,
            tags = {"Employee"})
    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = ResponseEntity.class)})
    @GetMapping(value = "/all", produces = {"application/json", "text/json"})
    public ResponseEntity requestAllArea() {
        List<Employee> employees = employeeService.findAllEmployee();
        if (employees != null) {
            return new ResponseEntity<>(new ModelContainer<>(employees), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("count not find any employee!", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Employee findEmployeeByEmail(String email) {
        return null;
    }

    @Override
    @ApiOperation(value = "Get employee info",
            notes = "Mobile App",
            response = Employee.class,
            tags = {"Get by Email"})
    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = Employee.class)})
    @GetMapping(value = "/info/{id}", produces = {"application/json", "text/json"})
    public Employee findEmployeeById(@PathVariable("id") int id) {
        //email = email.replaceAll("%40", "@");
        return employeeService.findFirstById(id);
    }

}
