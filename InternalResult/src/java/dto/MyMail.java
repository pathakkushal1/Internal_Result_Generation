package dto;

public class MyMail {

    private String gmailUserName="userID", gmailUserPass="UserPassword", senderEmailId="USEREmailID", receiverEmailId, subject, content;

    public String getGmailUserName() {
        return gmailUserName;
    }

    public void setGmailUserName(String gmailUserName) {
        this.gmailUserName = gmailUserName;
    }

    public String getGmailUserPass() {
        return gmailUserPass;
    }

    public void setGmailUserPass(String gmailUserPass) {
        this.gmailUserPass = gmailUserPass;
    }

    public String getSenderEmailId() {
        return senderEmailId;
    }

    public void setSenderEmailId(String senderEmailId) {
        this.senderEmailId = senderEmailId;
    }

    public String getReceiverEmailId() {
        return receiverEmailId;
    }

    public void setReceiverEmailId(String receiverEmailId) {
        this.receiverEmailId = receiverEmailId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
