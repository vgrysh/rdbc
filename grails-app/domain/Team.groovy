/**
 * User: vgrysh
 * Date: 10/09/13
 */
class Team extends BaseDomain {
    String name

    static hasMany = [sprints: Sprint]

    static constraints = {
        name nullable: false

    }

}
