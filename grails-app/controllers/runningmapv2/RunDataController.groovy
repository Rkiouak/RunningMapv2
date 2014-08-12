package runningmapv2



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RunDataController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RunData.list(params), model:[runDataInstanceCount: RunData.count()]
    }

    def show(RunData runDataInstance) {

        respond runDataInstance
    }

    def create() {
        respond new RunData(params)
    }

    @Transactional
    def save(RunData runDataInstance) {
        if (runDataInstance == null) {
            notFound()
            return
        }

        if (runDataInstance.hasErrors()) {
            respond runDataInstance.errors, view:'create'
            return
        }

        runDataInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'runData.label', default: 'RunData'), runDataInstance.id])
                redirect runDataInstance
            }
            '*' { respond runDataInstance, [status: CREATED] }
        }
    }

    def edit(RunData runDataInstance) {
        respond runDataInstance
    }

    @Transactional
    def update(RunData runDataInstance) {
        if (runDataInstance == null) {
            notFound()
            return
        }

        if (runDataInstance.hasErrors()) {
            respond runDataInstance.errors, view:'edit'
            return
        }

        runDataInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RunData.label', default: 'RunData'), runDataInstance.id])
                redirect runDataInstance
            }
            '*'{ respond runDataInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RunData runDataInstance) {

        if (runDataInstance == null) {
            notFound()
            return
        }

        runDataInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RunData.label', default: 'RunData'), runDataInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'runData.label', default: 'RunData'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
