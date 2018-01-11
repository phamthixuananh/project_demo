package com.sungwoo.aps.controllers;

import com.sungwoo.aps.commons.AreaStatus;
import com.sungwoo.aps.models.Area;
import com.sungwoo.aps.models.Employee;
import com.sungwoo.aps.resp.ModelContainer;
import com.sungwoo.aps.resp.PermissionResp;
import com.sungwoo.aps.services.AreaService;
import com.sungwoo.aps.services.TCPConnection;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author phloc
 */
@Api(value = "Area", description = "Area Api")
@RestController
@RequestMapping("/area")
public class AreaController implements AreaApi {
    private final AreaService areaService;

    @Autowired
    public AreaController(AreaService areaService) {
        this.areaService = areaService;
    }

    @Override
    @ApiOperation(value = "Get all parking area info",
            notes = "Mobile App submits to get parking area info: name, status, long, lat....",
            response = ResponseEntity.class,
            tags = {"R-A-PIR-01, R-A-PIR-02"})
    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = ResponseEntity.class)})
    @GetMapping(value = "/all", produces = {"application/json", "text/json"})
    public ResponseEntity requestAllArea() {
        List<Area> area = areaService.findAll();
        if (area != null) {
            return new ResponseEntity<>(new ModelContainer<>(area), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("count not find any area!", HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    @ApiOperation(value = "Request parking",
            notes = "Mobile App submits a \"PARKING\" request. \n" +
                    "After WebApp recieved this request, it forwards to C++ swautoparking service to process with car.",
            response = ResponseEntity.class,
            tags = {"R-S-PR-01, R-S-PR-02"})
    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = ResponseEntity.class)})
    @PostMapping(value = "/parking", produces = {"application/json", "text/json"})
    public ResponseEntity requestCarParking(@RequestParam("car") int carUid) {
        Area area = areaService.findFirstByStatus(AreaStatus.EMPTY.value());
        if (area != null) {
            TCPConnection.Permission resp = areaService.doOnRequestParking(carUid, area.getUid());
            PermissionResp permissionResp = new PermissionResp(String.format("0x%x", resp.getValue()), resp.getDes());
            return new ResponseEntity<>(permissionResp, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    @ApiOperation(hidden = true,
            value = "Create parking area",
            notes = "Create parking area",
            response = ResponseEntity.class,
            tags = {"Create"})
    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = ResponseEntity.class)})
    @PostMapping(value = "/create",consumes = MediaType.ALL_VALUE,
            produces = {MediaType.ALL_VALUE})
    public ResponseEntity createArea(Area area) {
        Area a = areaService.createArea(area);
        if (a != null) {
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }
//    @Override
//    @ApiOperation(value = "Get all parking area info",
//            notes = "Mobile App submits to get parking area info: name, status, long, lat....",
//            response = ResponseEntity.class,
//            tags = {"All employee"})
//    @ApiResponses(value = {@ApiResponse(code = 200, message = "OK", response = ResponseEntity.class)})
//    @GetMapping(value = "/employees", produces = {"application/json", "text/json"})
//    public ResponseEntity requestAllEmployee() {
//        List<Employee> employees = new ArrayList<>();
//        employees.add(new Employee("My Linh", "01-01-1996", "BA", "IKorn", "02-01-2018", "mylinh@ikornsolutions.com", "0990988221"));
//        employees.add(new Employee("Tuyet Mai", "01-03-1995", "QC", "IKorn", "02-08-2017", "nttmai@ikornsolutions.com", "0164123321"));
//        employees.add(new Employee("Kieu Diem", "11-01-1990", "PHP", "IKorn", "02-01-2015", "ttkdiem@ikornsolutions.com", "0988761832"));
//        employees.add(new Employee("Hong Van", "01-01-1989", "HR", "IKorn", "20-06-2016", "nthvan@ikornsolutions.com", "0165999222"));
//        employees.add(new Employee("Anh Duy", "01-01-1991", "C++", "IKorn", "02-01-2018", "haduy@ikornsolutions.com", "0945141233"));
//        employees.add(new Employee("Tan Hai", "01-01-1989", "Java", "IKorn", "02-01-2015", "hthai@ikornsolutions.com", "0945141233"));
//        if (employees != null) {
//            return new ResponseEntity<>(new ModelContainer<>(employees), HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>("count not find any area!", HttpStatus.BAD_REQUEST);
//        }
//    }
}
