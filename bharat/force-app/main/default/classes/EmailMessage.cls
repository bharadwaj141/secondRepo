//With Template-----------------
public class EmailMessage {
    public static void main(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemp = [select id,Subject,Body from EmailTemplate Where Name='DDN Template'];
        Contact con = [Select id,Name from Contact where lastName='shah'];
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTemplateId(emailTemp.id);
        mail.setTargetObjectId(con.Id);
        mailList.add(mail);
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
        }
        
    }
}