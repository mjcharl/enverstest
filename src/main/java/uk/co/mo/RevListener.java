package uk.co.mo;

import org.hibernate.envers.RevisionListener;

public class RevListener implements RevisionListener {
    public void newRevision(Object revisionEntity) {

        //In a real system the username would come from the security context
        String username = "mjcharl";

        RevEntity revEntity = (RevEntity) revisionEntity;
        revEntity.setUsername(username);
    }
}