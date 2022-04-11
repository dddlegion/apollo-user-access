FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY ["API/Apollo.UserAccess.API.csproj", "API/"]
COPY ["Domain/Apollo.UserAccess.Domain.csproj", "Domain/"]
COPY ["Tests/Unit/Apollo.UserAccess.Tests.Unit.csproj", "Tests/Unit/"]

RUN dotnet restore "API/Apollo.UserAccess.API.csproj"
COPY . .
WORKDIR "/src"
