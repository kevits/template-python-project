import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s:%(module)s - %(message)s",
)

log: logging.Logger = logging.getLogger(__name__)
log.setLevel(logging.INFO)  # FIX: Fix this!


def main() -> None:
    """Main entry point of the application."""
    # TODO: Main functionality goes here.
    log.info("Hello, world!")


if __name__ == "__main__":
    # Call main function
    main()
