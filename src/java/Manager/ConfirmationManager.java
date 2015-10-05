/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Until.DBHelper;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.sql.SQLException;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import Entity.UserInfo;
import Entity.PackageDescriptionInfo;
import Entity.CartInfo;

/**
 *
 * @author mac
 */
public class ConfirmationManager {

    DBHelper db;

    public ConfirmationManager() throws Exception {
        this.db = new DBHelper();
    }

    public void confirmationEmail(UserInfo UI, PackageDescriptionInfo packageName, CartInfo info) {
        final String username = "cop5725.final.project@gmail.com";
        final String password = "guestpassword";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            String paid = "Pay On Site";
            if (info.paid == true) {
                paid = "Paid Online";
            }
            String workshop = "Not Registered";
            if (info.workshop == true) {
                workshop = "Registered for Workshop";
            }
            String paper = "No Submitted Paper";
            if (info.paperId != -1) {
                paper = "Submitted Paper";
            }
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("cop5725.final.project@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(UI.email));
            message.setSubject("Conference Confirmation Email");
            message.setText("Your Registration has been confirmed!" + "\n"
                    + "FirstName: " + UI.firstName + "\n"
                    + "LastName: " + UI.lastName + "\n"
                    + "PhoneNumber: " + UI.phonnumber + "\n"
                    + "JobTitle: " + UI.jobtitle + "\n"
                    + "Company: " + UI.company + "\n"
                    + "\n"
                    + "Conference Package: " + packageName.category + "\n"
                    + "Total: " + info.total + "\n"
                    + " Paid: " + paid + "\n"
                    + "Workshop: " + workshop + "\n"
                    + "Paper: " + paper + "\n"
                    + "Food Choice: " + info.food);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
