
###############################
FROM maurobernal/net7-build as build
ARG BUILD_CONFIGURATION=Release

##Pass solution
WORKDIR /src/
COPY . .

##BUILD
WORKDIR /src/
RUN dotnet restore DemoBlazor/DemoBlazor/DemoBlazor.csproj
RUN dotnet build DemoBlazor/DemoBlazor/DemoBlazor.csproj --configuration $BUILD_CONFIGURATION --no-restore -o /app/build

FROM build AS publish
RUN dotnet publish DemoBlazor/DemoBlazor/DemoBlazor.csproj --configuration $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

#############################
FROM maurobernal/net7-base as base
USER root
EXPOSE 80
EXPOSE 443
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT [ "dotnet", "DemoBlazor.dll" ]

