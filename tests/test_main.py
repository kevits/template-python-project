from app.main import main


def test_main_logs_hello_world(caplog):
    with caplog.at_level("INFO", logger="app.main"):
        main()
    assert "Hello, world!" in caplog.text
