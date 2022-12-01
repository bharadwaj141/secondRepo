//With List Email---------

public class EmailUtility {
 public static void main(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         String[] toAddresses = new String[]{'bharat.bhusan@cloudanalogy.com'};
         mail.setToAddresses(toAddresses);
         String subject = 'Test Message';
         mail.setSubject(subject);
         String body = 'This is Only a Test message';
         mail.setPlainTextBody(body);
        mailList.add(mail);
        if(!mailList.isEmpty()){
           Messaging.sendEmail(mailList); 
        }
         
    }
}