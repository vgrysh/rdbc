class SprintCalculationService {

    Sprint save(Sprint sprint) {
        Team team = sprint.team
        def sprints = team.sprints
        if (!sprints) {
            sprint.index = 1
            calculate(sprint, team)
        } else {
            def lastSprint = sprints.find { it.index == sprints.index.max() }
            sprint.index = sprints.index.max() + 1
            calculate(sprint, lastSprint)
        }
        sprint.save()
        sprint

    }

    Sprint update(Sprint sprint) {
        Team team = sprint.team
        def sprints = team.sprints
        if (sprints.size() == 1) {
            calculate(sprint, team)
            sprint.save()
        } else {
            def index = sprint.index
            if (index == 1) {
                calculate(sprint, team)
            }
            def sprintCur
            def sprintPrev
            for (int i = index; i++; i < sprints.size() + 1) {
                sprintCur = sprints.find { it.index == i }
                sprintPrev = sprints.find { it.index == i - 1 }
                calculate(sprintCur, sprintPrev)
                sprintCur.save()

            }
        }

    }

    def delete(Sprint sprint) {
        Team team = sprint.team
        def sprints = team.sprints
        def index = sprint.index
        sprint.delete()
        def sprintCur
        for (int i = index + 1; i++; i < sprints.size() + 1) {
            sprintCur = sprints.find { it.index == i }
            sprintCur.index--
            sprintCur.save()

        }
        def sprintFromUpdate = sprints.find { it.index == index }
        update(sprintFromUpdate)


    }

    def calculate(Sprint sprint, BaseDomain lastSprint) {
        sprint.baseLine = lastSprint.baseLine - sprint.expectedVelocity
        sprint.scope = lastSprint.scope + sprint.scopeIncrease
        sprint.actual = lastSprint.actual - sprint.actualVelocity + sprint.scopeIncrease
    }


}
