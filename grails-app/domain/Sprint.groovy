/**
 * User: vgrysh
 * Date: 10/09/13
 */
class Sprint extends BaseDomain {
    Integer index = 0
    Date endDate
    BigDecimal actualVelocity
    BigDecimal expectedVelocity
    BigDecimal scopeIncrease


    static belongsTo = [team: Team]

    static constraints = {
        index nullable: false
        endDate nullable: false
        actualVelocity nullable: false
        expectedVelocity nullable: false
        scopeIncrease nullable: false
    }
}
