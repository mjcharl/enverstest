package uk.co.mo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.Set;

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

        //Create an order
        Order order = new Order();
        order.setCustomer(customer);
        order.setPrice(BigDecimal.valueOf(9.99));
        order.setProduct("Boots");
        order.setQuantity(8);

        Set<Order> orders = customer.getOrders();
        orders.add(order);

        //Update the customer
        customer.setFirstName("Joe");
        customer.setLastName("Bloggs");
        repository.save(customer);

        //Update the customer again
        customer.setFirstName("Bugs");
        customer.setLastName("Bunny");
        repository.save(customer);

        //Delete the customer
        //repository.delete(customer);
    }
}
