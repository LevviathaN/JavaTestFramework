package ui.utils.pdf;

public enum ImageType {
    BINARY {
        int toBufferedImageType() {
            return 12;
        }
    },
    GRAY {
        int toBufferedImageType() {
            return 10;
        }
    },
    RGB {
        int toBufferedImageType() {
            return 1;
        }
    },
    ARGB {
        int toBufferedImageType() {
            return 2;
        }
    };

    private ImageType() {
    }

    abstract int toBufferedImageType();
}

