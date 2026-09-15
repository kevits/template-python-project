import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s:%(module)s - %(message)s",
)

log: logging.Logger = logging.getLogger(__name__)
log.setLevel(logging.INFO)

def main() -> None:
    log.info("Hello, world!")


if __name__ == "__main__":
    main()
