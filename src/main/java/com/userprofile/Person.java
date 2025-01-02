package com.userprofile;

public class Person {
    // Private fields (attributes)
    private String name;
    private int age;
    private String address;

    // Default constructor (no parameters)
    public Person() {
        this.name = "Unknown";
        this.age = 0;
        this.address = "Unknown";
    }

    // Overloaded constructor with parameters
    public Person(String name, int age, String address) {
        this.name = name;
        this.age = age;
        this.address = address;
    }

    // Getter method for name
    public String getName() {
        return name;
    }

    // Setter method for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for age
    public int getAge() {
        return age;
    }

    // Setter method for age
    public void setAge(int age) {
        this.age = age;
    }

    // Getter method for address
    public String getAddress() {
        return address;
    }

    // Setter method for address
    public void setAddress(String address) {
        this.address = address;
    }

    // toString method to display person details
    @Override
    public String toString() {
        return "Person[name=" + name + ", age=" + age + ", address=" + address + "]";
    }
}
