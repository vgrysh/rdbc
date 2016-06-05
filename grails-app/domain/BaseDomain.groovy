class BaseDomain {
    BigDecimal baseLine
    BigDecimal scope
    BigDecimal actual
     Date startDate


    static constraints = {
        baseLine nullable: false
        scope nullable: false
        actual nullable: false
        startDate nullable: false
    }
}
