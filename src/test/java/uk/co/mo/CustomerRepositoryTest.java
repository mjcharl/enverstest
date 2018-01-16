package uk.co.mo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CustomerRepositoryTest {

    @Autowired
    CustomerRepository repository;

    @Test
    public void auditCustomer() {

        //Create a customer
        Customer customer = new Customer("Martin", "Charlesworth");
        repository.save(customer);

        //Update the customer
        customer.setFirstName("Joe");
        customer.setLastName("Bloggs");
        repository.save(customer);

        //Update the customer again
        customer.setFirstName("Bugs");
        customer.setLastName("Bunny");
        repository.save(customer);

        //Delete the customer
        repository.delete(customer);
    }
}
