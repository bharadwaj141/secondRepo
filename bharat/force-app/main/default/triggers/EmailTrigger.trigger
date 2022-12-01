//Tigger On account for email Alert---------------

trigger EmailTrigger on Contact (after insert) {
    for(Contact con:Trigger.new){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{con.Email};
          String subject = 'Test Message';      
         String body = 'This is Only a Test message';
         mail.setToAddresses(toAddresses);
         mail.setSubject(subject);
         mail.setPlainTextBody(body);
         Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
   
}