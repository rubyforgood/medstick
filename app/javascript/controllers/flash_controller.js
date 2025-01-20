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
        padding: '1.5rem',
        showClass: {
          popup: ''
        },
        hideClass: {
          popup: ''
        },
        showConfirmButton: true,
        buttonsStyling: true,
        showCloseButton: false,
        customClass: {
          confirmButton: 'swal2-confirm swal2-styled',
          actions: 'swal2-actions-right',
          popup: 'swal2-popup-custom',
          title: 'swal2-title-custom',
          icon: 'swal2-icon-custom'
        }
      })

      Toast.fire({
        icon: this.typeValue || 'success',
        title: this.messageValue,
        width: '600px'
      })
    }
  }
}
