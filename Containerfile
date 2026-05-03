FROM scratch AS ctx
COPY bazzite-build /

FROM ghcr.io/ublue-os/bazzite-nvidia-open:stable

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
	--mount=type=tmpfs,dst=/tmp \
	sh /ctx/build.sh

RUN bootc container lint
