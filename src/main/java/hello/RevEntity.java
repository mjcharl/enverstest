package hello;

import org.hibernate.envers.RevisionEntity;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionNumber;
import org.hibernate.envers.RevisionTimestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "revinfo")
@RevisionEntity(RevListener.class)
public class RevEntity {

    @Id
    @GeneratedValue
    @RevisionNumber
    private int rev;

    @RevisionTimestamp
    private long revtstmp;
    private String username;

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}