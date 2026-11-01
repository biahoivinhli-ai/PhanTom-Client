#!/bin/sh
#
# Gradle wrapper script - tự download Gradle nếu chưa có
#

GRADLE_VERSION="8.10"
GRADLE_DIST_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"

# Tìm home của script
PRG="$0"
while [ -h "$PRG" ]; do
  LS=$(ls -ld "$PRG")
  LINK=$(expr "$LS" : '.*-> \(.*\)$')
  if expr "$LINK" : '/.*' > /dev/null; then
    PRG="$LINK"
  else
    PRG="$(dirname "$PRG")/$LINK"
  fi
done
APP_HOME="$(cd "$(dirname "$PRG")" && pwd -P)"

# Tìm Java
if [ -n "$JAVA_HOME" ]; then
  JAVACMD="$JAVA_HOME/bin/java"
else
  JAVACMD="java"
fi
if ! command -v "$JAVACMD" >/dev/null 2>&1; then
  echo "ERROR: java không tìm thấy. Set JAVA_HOME hoặc cài JDK 21+."
  exit 1
fi

WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
WRAPPER_PROPS="$APP_HOME/gradle/wrapper/gradle-wrapper.properties"

# Download gradle-wrapper.jar nếu chưa có
if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Downloading gradle-wrapper.jar..."
  mkdir -p "$APP_HOME/gradle/wrapper"
  # Try curl
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "https://raw.githubusercontent.com/gradle/gradle/v${GRADLE_VERSION}.0/gradle/wrapper/gradle-wrapper.jar" \
      -o "$WRAPPER_JAR" 2>/dev/null || true
  fi
  # Nếu curl fail, thử wget
  if [ ! -f "$WRAPPER_JAR" ] && command -v wget >/dev/null 2>&1; then
    wget -q "https://raw.githubusercontent.com/gradle/gradle/v${GRADLE_VERSION}.0/gradle/wrapper/gradle-wrapper.jar" \
      -O "$WRAPPER_JAR" 2>/dev/null || true
  fi
  if [ ! -f "$WRAPPER_JAR" ]; then
    echo "ERROR: Không download được gradle-wrapper.jar."
    echo "Hãy copy thủ công vào: $WRAPPER_JAR"
    echo "Hoặc dùng: gradle build (nếu đã cài Gradle system-wide)"
    exit 1
  fi
fi

exec "$JAVACMD" \
  -Xmx2048m \
  -Xms512m \
  -Dfile.encoding=UTF-8 \
  -classpath "$WRAPPER_JAR" \
  org.gradle.wrapper.GradleWrapperMain \
  "$@"
