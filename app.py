from vizro import Vizro
import vizro.models as vm



home = vm.Page(
    title="Home",
    components=[
        vm.Card(
            text = """
            ## Text Here
            Hello
            """ 
        )
    ]
)

dashboard = vm.Dashboard(
    title="My Dashboard",
    pages = [home],
)

# https://github.com/mckinsey/vizro
# https://huggingface.co/vizro
# https://huggingface.co/spaces/vizro/demo-features/blob/main/app.py


app = Vizro().build(dashboard)

server = app.dash.server


if __name__ == "__main__":
    server.run(debug=True)