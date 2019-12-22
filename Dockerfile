FROM mcr.microsoft.com/dotnet/core/sdk

LABEL author="Mohammed Alkaabi"
ENV DOTNET_USE_POLLING_FILE_WATCHER 1

WORKDIR /app

EXPOSE 5000
# CMD ["/bin/bash", "-c", "dotnet restore && dotnet watch run"]

ENTRYPOINT [ "dotnet", "watch", "run", "--no-restore", "--urls", "http://0.0.0.0:5000"]

# run command after building the image
# docker run -p 8080:80 -v ${pwd}:/app alkaabi/aspnetcore 
