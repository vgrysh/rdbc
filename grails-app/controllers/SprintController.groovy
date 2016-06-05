import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class SprintController {
    def sprintCalculationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sprintInstanceList: Sprint.list(params), sprintInstanceTotal: Sprint.count()]
    }

    def create() {
        [sprintInstance: new Sprint(params)]
    }

    def save(Sprint sprintInstance) {
        if (!sprintCalculationService.save(sprintInstance)) {
            render(view: "create", model: [sprintInstance: sprintInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sprint.label', default: 'Sprint'), sprintInstance.index])
        redirect(action: "show", id: sprintInstance.id)
    }

    def show() {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.index])
            redirect(action: "list")
            return
        }

        [sprintInstance: sprintInstance]
    }

    def edit() {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])
            redirect(action: "list")
            return
        }

        [sprintInstance: sprintInstance]
    }

    def update() {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])
            redirect(action: "list")
            return
        }

        sprintInstance.properties = params
        sprintCalculationService.update(sprintInstance)
        if (!sprintInstance.save(flush: true)) {
            render(view: "edit", model: [sprintInstance: sprintInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sprint.label', default: 'Sprint'), sprintInstance.id])
        redirect(action: "show", id: sprintInstance.id)
    }

    def delete() {
        def sprintInstance = Sprint.get(params.id)
        if (!sprintInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])
            redirect(action: "list")
            return
        }

        try {
            sprintCalculationService.delete(sprintInstance)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sprint.label', default: 'Sprint'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def draw() {


    }

    def drawSvg() {

       return [id:params.id]
    }
    def getJSON(){
        def teamInstance = Team.get(params.id)
        def response = [["Sprints","Base Line","Scope","Actual"]]
        response << ["Start",teamInstance.baseLine, teamInstance.scope, teamInstance.actual]
        def sprints  = teamInstance.sprints.sort {it.index}
        response += sprints.collect { Sprint sp ->
            def name = "Sprint ${sp.index}"
            return ["${name}",sp.baseLine, sp.scope, sp.actual]
        }

        render response as JSON

    }

}
