import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {
  static values = {
    message: String,
    type: String
  }

  connect() {
    if (this.messageValue) {
      const Toast = Swal.mixin({
        toast: true,
        position: 'top',
        width: '600px',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true
      })

      Toast.fire({
        icon: this.typeValue || 'success',
        title: this.messageValue
      })
    }
  }
}
