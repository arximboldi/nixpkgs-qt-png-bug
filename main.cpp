
#include <QtGui/QPixmap>
#include <QtGui/QImageReader>
#include <QtWidgets/QApplication>

#include <iostream>

int main(int argc, char* argv[])
{
  QApplication app{argc, argv};

  if (argc != 2) {
    std::cerr << "Usage: " << argv[0] << " <image>" << std::endl;
    return 1;
  }

  std::cout << "QImageReader::supportedImageFormats() =";
  for (auto&& fmt : QImageReader::supportedImageFormats())
    std::cout << " " << fmt.data();
  std::cout << std::endl;

  QPixmap pixmap{argv[1]};
  std::cout << "QPixmap::isNull() = " << pixmap.isNull() << std::endl;
  return pixmap.isNull();
}
