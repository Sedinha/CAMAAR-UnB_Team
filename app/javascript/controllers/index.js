// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import  TurmaController from "./turma_controller"

console.log("=== Registering Turma Controller ===")

application.register("turma",TurmaController)
eagerLoadControllersFrom("controllers", application)
