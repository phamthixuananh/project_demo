package com.sungwoo.aps.models;

import org.json.JSONException;
import org.json.JSONObject;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * @author phloc
 */
@Entity
@Table(name = "employee")
public class Employee implements SungWooModel {

    public Employee(String name, String birthday, String position, String department, String dateContract, String email, String phone) {
        this.name = name;
        this.birthday = birthday;
        this.position = position;
        this.department = department;
        this.dateContract = dateContract;
        this.email = email;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDateContract() {
        return dateContract;
    }

    public void setDateContract(String dateContract) {
        this.dateContract = dateContract;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public Employee() {
    }


    @Override
    public String toString() {
        return "Employee{" +
                "name=" + name +
                ", email='" + email + '\'' +
                ", phone=" + phone +
                ", department=" + department +
                ", position=" + position +
                ", dateContract=" + dateContract +
                ", birthday=" + birthday +
                '}';
    }

    @Override
    public JSONObject toJSON() {
        JSONObject body = new JSONObject();
        try {
            body.put("area", name);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return body;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", length = 16)
    private int id;

    @Column(name = "name")
    private String name;
    @Column(name = "birthday")
    private String birthday;
    @Column(name = "position")
    private String position;
    @Column(name = "department")
    private String department;
    @Column(name = "datecontract")
    private String dateContract;
    @Column(name = "email")
    private String email;
    @Column(name = "phone")
    private String phone;

}
