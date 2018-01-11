package com.sungwoo.aps.repo;

        import com.sungwoo.aps.models.Employee;
        import org.springframework.data.jpa.repository.JpaRepository;
        import org.springframework.stereotype.Repository;

/**
 * @author phloc
 */
@Repository
public interface EmployeeRepo extends JpaRepository<Employee, Integer> {

    Employee findFirstByEmail(String email);
    Employee findFirstById(int id);
}
