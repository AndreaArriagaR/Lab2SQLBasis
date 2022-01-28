import ui
import db

def list_people():
    print()
    selection = ui.options("Sort by...", list(zip(db.PERSON_LIST_DISPLAY_FIELDS, db.PERSON_LIST_DISPLAY_FIELD_HEADINGS)))
    data = db.get_people_list(order_by=selection)
    
    print()
    ui.print_heading("People List")
    print()
    ui.table(db.PERSON_LIST_DISPLAY_FIELD_HEADINGS, data)
    
def quit():
    exit(0)


while True:
    ui.menu("Main Menu", (
        ("_List people", list_people),
        ("_Quit", quit)
    ))