import sqlite3

def get_connection():
    connection = sqlite3.connect("data.sqlite")

    # Allow for indexing of rows using either integers or column names
    # See https://docs.python.org/3/library/sqlite3.html#row-objects
    connection.row_factory = sqlite3.Row  

    return connection

# A list of (column name, pretty label) tuples
PERSON_LIST_DISPLAY_FIELDS = ('person_id', 'first_name', 'last_name', 'birthday', 'email', 'phone', 'address')
PERSON_LIST_DISPLAY_FIELD_HEADINGS = ("ID", "First Name", "Last Name", "Birthday", "Email", "Phone", "Address")
def get_people_list(order_by):

    assert order_by in PERSON_LIST_DISPLAY_FIELDS, "The order_by argument must be one of: " + ", ".join(PERSON_LIST_DISPLAY_FIELDS)

    with get_connection() as cnx:
        # TODO: Edit this code block so that it returns the list of people in the person table
        # in the form described in the lab instructions
        cursor = cnx.cursor()

        sql = """
            SELECT person_id, first_name, last_name, birthday, 
            email, phone, address_line1 || ' ' || address_line2 
            || ' ' || city || ', ' || prov || ' ' || postcode FROM person 

        """
        if order_by == "person_id":
            sql += ""
        elif order_by == "first_name":
            sql += "ORDER BY first_name"
        elif order_by == "last_name":
            sql += "ORDER BY last_name"
        elif order_by == "birthday":
            sql += "ORDER BY birthday"
        elif order_by == "email":
            sql += "ORDER BY email"
        elif order_by == "phone":
            sql += "ORDER BY phone"
        else:
            sql += "ORDER BY address_line1"

        rows = cursor.execute(sql).fetchall()

        return rows

if __name__ == "__main__":
    get_people_list("person_id")
