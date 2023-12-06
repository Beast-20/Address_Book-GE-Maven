package com.example;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        AddressBookHelper addressBookHelper = new AddressBookHelper();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\n===== Address Book Management System =====");
            System.out.println("1. Add new Address Book");
            System.out.println("2. Access Address Book");
            System.out.println("3. View All Address Books");
            System.out.println("4. Search contacts by city across all address books");
            System.out.println("5. Search contacts by state across all address books");
            System.out.println("6. Count contacts by city across all address books");
            System.out.println("7. Count contacts by state across all address books");
            System.out.println("8. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter the name for the new Address Book: ");
                    scanner.nextLine();
                    String newAddressBookName = scanner.nextLine();
                    addressBookHelper.addAddressBook(newAddressBookName);
                    break;

                case 2:
                    System.out.print("Enter the name of the Address Book you want to access: ");
                    scanner.nextLine();
                    String accessAddressBookName = scanner.nextLine();
                    AddressBook accessedAddressBook = addressBookHelper.accessAddressBook(accessAddressBookName);
                    if (accessedAddressBook != null) {
                        addressBookOperations(accessedAddressBook, addressBookHelper);
                    } else {
                        System.out.println("Address Book not found.");
                    }
                    break;

                case 3:
                    addressBookHelper.viewAllAddressBooks();
                    break;

                case 4:
                    System.out.print("Enter the city to search: ");
                    scanner.nextLine();
                    String searchCity = scanner.nextLine();
                    addressBookHelper.searchContactsByCity(searchCity);
                    break;

                case 5:
                    System.out.print("Enter the state to search: ");
                    scanner.nextLine();
                    String searchState = scanner.nextLine();
                    addressBookHelper.searchContactsByState(searchState);
                    break;

                case 6:
                    System.out.print("Enter the city to count contacts: ");
                    scanner.nextLine();
                    String countCity = scanner.nextLine();
                    addressBookHelper.countContactsByCity(countCity);
                    break;

                case 7:
                    System.out.print("Enter the state to count contacts: ");
                    scanner.nextLine();
                    String countState = scanner.nextLine();
                    addressBookHelper.countContactsByState(countState);
                    break;

                case 8:
                    System.out.println("Exiting Address Book Management System. Goodbye!");
                    System.exit(0);
                    break;


                default:
                    System.out.println("Invalid choice. Please enter a valid option.");
            }
        }
    }

    private static void addressBookOperations(AddressBook addressBook, AddressBookHelper addressBookHelper) {
        while (true) {
            System.out.println("\n===== Address Book Operations =====");
            System.out.println("1. Add new Contact");
            System.out.println("2. Edit existing Contact");
            System.out.println("3. Delete Contact");
            System.out.println("4. Sort Address Book");
            System.out.println("5. Display Contacts");
            System.out.println("6. To write the file");
            System.out.println("7. To read from the file");
            System.out.println("8. Go to main menu");
            System.out.print("Enter your choice: ");
            Scanner scanner = new Scanner(System.in);
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    addressBookHelper.addContact(addressBook);
                    break;

                case 2:
                    editContact(addressBook, addressBookHelper);
                    break;

                case 3:
                    deleteContact(addressBook, addressBookHelper);
                    break;

                case 4:
                    addressBookHelper.sortAddressBook(addressBook);
                    break;

                case 5:
                    addressBook.displayContacts();
                    break;
                case 6:
                    addressBookHelper.writeToFile(addressBook);
                    break;

                case 7:
                    addressBookHelper.readfromFile(addressBook);
                    break;

                case 8:
                    return;

                

                default:
                    System.out.println("Invalid choice. Please enter a valid option.");
            }
        }
    }

    private static void editContact(AddressBook addressBook, AddressBookHelper addressBookHelper) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the First Name of the contact to edit: ");
        String firstNameToEdit = scanner.nextLine();

        for (Contact contact : addressBookHelper.accessAddressBook(addressBook.getName()).getContacts()) {
            {
            if (contact.getFirstName().equalsIgnoreCase(firstNameToEdit)) {
                System.out.println("Enter new details for the contact:");
                System.out.print("Enter First Name: ");
                String newFirstName = scanner.nextLine();
                System.out.print("Enter Last Name: ");
                String newLastName = scanner.nextLine();
                System.out.print("Enter Address: ");
                String newAddress = scanner.nextLine();
                System.out.print("Enter City: ");
                String newCity = scanner.nextLine();
                System.out.print("Enter State: ");
                String newState = scanner.nextLine();
                System.out.print("Enter Zip: ");
                String newZip = scanner.nextLine();
                System.out.print("Enter Phone Number: ");
                String newPhoneNumber = scanner.nextLine();
                System.out.print("Enter Email: ");
                String newEmail = scanner.nextLine();

                Contact updatedContact = new Contact(newFirstName, newLastName, newAddress, newCity, newState, newZip, newPhoneNumber, newEmail);
                addressBook.editContact(firstNameToEdit, updatedContact);
                System.out.println("Contact updated successfully.");
                return;
            }
        }

        System.out.println("Contact with First Name " + firstNameToEdit + " not found.");
    }
}

    private static void deleteContact(AddressBook addressBook, AddressBookHelper addressBookHelper) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the First Name of the contact to delete: ");
        String firstNameToDelete = scanner.nextLine();

        addressBook.deleteContact(firstNameToDelete);
        System.out.println("Contact deleted successfully.");
    }
}

