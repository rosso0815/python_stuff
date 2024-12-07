from sqlalchemy import create_engine, text

engine = create_engine("postgresql://pfistera:@localhost/pfistera")

with engine.connect() as conn:
    result = conn.execute(text("select 'hello world'"))
    print(result.all())

    conn.execute(text("DROP TABLE IF EXISTS some_table"))
    conn.execute(text("CREATE TABLE some_table (x int, y int)"))
    conn.execute(
        text("INSERT INTO some_table (x, y) VALUES (:x, :y)"),
        [{
            "x": 1,
            "y": 1
        }, {
            "x": 2,
            "y": 4
        }],
    )
    result = conn.execute(text("SELECT x, y FROM some_table"))
    for row in result:
        print(f"x: {row.x}  y: {row.y}")
