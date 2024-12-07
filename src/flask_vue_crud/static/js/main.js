new Vue({
    el: '#app',
    data() {
        return {
            name: 'BootstrapVue',
            show: true,
            message: "undefined"
        }
    },
    watch: {
        show(newVal) {
            console.log('Alert is now ' + (newVal ? 'visible' : 'hidden'))
        }
    },
    methods: {
        toggle() {
            console.log('Toggle button clicked')
            this.show = !this.show
        },
        callAjax() {
            console.log('callAjax')
            axios.get("/api/table1_definition").then((response) => {
              this.message = response.data['tablename']
            })
        },
        dismissed() {
            console.log('Alert dismissed')
        }
    }
})