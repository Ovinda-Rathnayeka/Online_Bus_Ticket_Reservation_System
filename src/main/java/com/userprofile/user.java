package com.userprofile;

public class user extends Person {

    private int id;
    private String firstname;
    private String lastname;
    private String nic;
    private String birthday;
    private int phone;
    private String address;
    private String email;
    private String password;

    public user(int id, String firstname, String lastname, String nic, String birthday, int phone, String address,
            String email, String password) {
        super();
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.nic = nic;
        this.birthday = birthday;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.password = password;
    }

    // Getter methods
    public int getId() {
        return id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getNic() {
        return nic;
    }

    public String getBirthday() {
        return birthday;
    }

    public int getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "User[id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", nic=" + nic +
                ", birthday=" + birthday + ", phone=" + phone + ", address=" + address + 
                ", email=" + email + "]";
    }
}
