import io.grpc.*
import io.streammachine.api.batch_exporters.v1.BatchExportersServiceGrpc
import io.streammachine.api.batch_exporters.v1.listBatchExportersRequest
import kotlinx.coroutines.runBlocking
import java.util.concurrent.Executor

fun main() {
    val channel = ManagedChannelBuilder
        .forAddress("apis.dev.streammachine.io", 443)
        .useTransportSecurity()
        .build()

    val jwt = "TODO fill in with result of 'strm auth print-access-token'"
    val client = BatchExportersServiceGrpc.newBlockingStub(channel)
        .withCallCredentials(StrmAuthUserCallCredentials(jwt))

    val req = listBatchExportersRequest {
        billingId = "TODO fill in with your billingid"
    }
    val res = client.listBatchExporters(req)
    println("res.batchExportersList.toString() = ${res.batchExportersList}")
}

class StrmAuthUserCallCredentials(private val strmAuthUser: String) : CallCredentials() {

    override fun applyRequestMetadata(requestInfo: RequestInfo, executor: Executor, metadataApplier: MetadataApplier) {
        executor.execute {
            runBlocking {
                val headers = Metadata()
                val strmAuthUserKey = Metadata.Key.of("authorization", Metadata.ASCII_STRING_MARSHALLER)
                headers.put(strmAuthUserKey, "Bearer $strmAuthUser")
                metadataApplier.apply(headers)
            }
        }
    }

    override fun thisUsesUnstableApi() {}
}
