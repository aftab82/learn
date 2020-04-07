class Email {
    String prospectName
    String emailAddress
    Date sendDate
    String notes

    String displayContents() {
        "Recipient: $prospectName\nAddress: $emailAddress\nDate: $sendDate\nSummary: $notes"
    }
}
