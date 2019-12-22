FROM mcr.microsoft.com/dotnet/core/sdk as build-env

WORKDIR /app

COPY *.csproj ./

RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/aspnet
WORKDIR /app
COPY --from=build-env /app/out .
EXPOSE 80

ENTRYPOINT ["dotnet", "/app/MvcAppDemo.dll"]


# docker run -d -p 5000:80/tcp alkaabi/aspnetcoreprod